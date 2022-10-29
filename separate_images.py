import os
from xml.dom import minidom

xml_dir = "assets/annotations"
with open('negatives.txt','w') as negative_file, open('positives.txt','w+') as positive_file:
    for xml_file in os.listdir(xml_dir):
        f = minidom.parse(f"{xml_dir}/{xml_file}")
        names = f.getElementsByTagName('name')
        for name in names:
            if name.firstChild.data == 'with_mask':
                positive_file.write(xml_file.replace("xml","png") + "\n")
                break
        else:
            negative_file.write(xml_file.replace("xml","png") + "\n")
