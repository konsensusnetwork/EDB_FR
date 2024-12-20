import os
import re
from slugify import slugify

def split_md_file(input_file):
    # Ensure the output directory exists
    if not os.path.exists('chapters'):
        os.makedirs('chapters')
    
    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract footnotes
    footnotes = re.findall(r'(^\[\^\d+\]:.*?$)', content, flags=re.MULTILINE)
    footnotes_dict = {re.search(r'^\[\^(\d+)\]:', fn).group(1): fn for fn in footnotes}
    
    # Remove footnotes from content
    content = re.sub(r'^\[\^\d+\]:.*?$', '', content, flags=re.MULTILINE)

    # Split content based on H1 headings
    chapters = re.split(r'(?m)^#\s+', content)

    # The first element before any H1 heading
    if chapters[0].strip():
        preface = chapters[0]
    else:
        preface = ''
    chapters = chapters[1:]  # Remove the preface or empty string from chapters list

    for chapter in chapters:
        # Extract the title and content
        lines = chapter.strip().split('\n')
        if not lines:
            continue
        title = lines[0].strip()
        body = '\n'.join(lines[1:]).strip()
        # Start of Selection
        slug = slugify(title.split('{')[0].strip())
        
        # Find footnotes used in this chapter
        footnote_refs = re.findall(r'\[\^(\d+)\]', body)
        chapter_footnotes = [footnotes_dict[num] for num in sorted(set(footnote_refs), key=int) if num in footnotes_dict]
        footnotes_text = '\n'.join(chapter_footnotes)
        
        # Append relevant footnotes to the chapter body
        if footnotes_text:
            body += '\n\n' + footnotes_text
        
        # Create the filename
        filename = f'chapters/{slug}.md'
        
        # Write the chapter to a new file
        with open(filename, 'w', encoding='utf-8') as outfile:
            outfile.write(f'# {title}\n\n{body}')
        print(f'Created {filename}')
    
    # Optionally, save the preface or introduction
    if preface.strip():
        filename = 'chapters/preface.md'
        with open(filename, 'w', encoding='utf-8') as outfile:
            outfile.write(preface.strip())
        print(f'Created {filename}')

if __name__ == '__main__':
    split_md_file('main.md')