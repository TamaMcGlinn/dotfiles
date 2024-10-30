#!/usr/bin/env python3
"""Reads contacts from abook and exports the numbers into Zoiper."""

# Open the input file for reading
import os
import re
import xml.sax.saxutils as saxutils

default_country_code = "+31"
phone_id_mapping = {
    "phone": "home_phone",
    "workphone": "work_phone",
    "mobile": "cell_phone",
}


def sanitize_phone_nr(value):
    """Sanitize phone number; remove invalid chars and ensure country code."""
    contact_number = (
        value.replace("-", "").replace(" ", "").replace("(", "").replace(")", "")
    )
    if re.match(r"^\+", contact_number):
        return contact_number
    if re.match(r"^00", contact_number):
        contact_number = contact_number.lstrip("0")
        return "+" + contact_number
    if re.match(r"^0", contact_number):
        contact_number = contact_number.lstrip("0")
        return default_country_code + contact_number
    else:
        raise RuntimeError(f"Invalid number {contact_number} doesn't start with 0 or +")


def contact_ident(number):
    """Return a zoiper identifier for the given number."""
    return f"Z{str(number).zfill(24)}"


def read_contacts(file):
    """Read abook addressbook file and return dictionary of contacts."""
    contacts = {}

    contact_name = None
    for line in file:
        line = line.strip()
        if re.match(".*=.*", line):
            key, value = line.split("=")
            if key == "name":
                contact_name = value
            elif key in phone_id_mapping.keys():
                contact_number = sanitize_phone_nr(value)
                new_number = {
                    "name": phone_id_mapping[key],
                    "value": contact_number,
                }
                if contact_name in contacts:
                    contacts[contact_name].append(new_number)
                else:
                    contacts[contact_name] = [new_number]
    return contacts


def write_contacts(contacts, output_file):
    """Write out Zoiper contacts.xml file."""
    output_file.write('<?xml version="1.0" encoding="UTF-8"?>\n')
    output_file.write("<contacts>\n")
    contact_nr = 0
    for contact_name, contact_numbers in contacts.items():
        output_file.write("\t<contact>\n")
        output_file.write(f"\t\t<ident>{contact_ident(contact_nr)}</ident>\n")
        contact_nr += 1
        xml_sanitized_name = saxutils.escape(contact_name)
        output_file.write(f"\t\t<first_name>{xml_sanitized_name}</first_name>\n")
        for number in contact_numbers:
            number_name = number["name"]
            number_value = number["value"]
            output_file.write(f"\t\t<{number_name}>{number_value}</{number_name}>\n")
        output_file.write("\t</contact>\n")
    output_file.write("</contacts>\n")


home = os.getenv("HOME")
address_book_contacts = None
with open(f"{home}/.abook/addressbook", "r") as address_book:
    address_book_contacts = read_contacts(address_book)

zoiper_filename = f"{home}/.Zoiper/Contacts.xml"
with open(zoiper_filename, "w") as zoiper_contacts:
    write_contacts(address_book_contacts, zoiper_contacts)

nr_of_new_contacts = len(address_book_contacts)
print(
    f"Successfully overwritten {zoiper_filename} with {nr_of_new_contacts} new contacts."
)
