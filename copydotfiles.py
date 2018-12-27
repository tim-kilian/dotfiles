import os
import shutil

src = os.path.dirname(os.path.abspath(__file__))
dest = os.path.expanduser('~')

exclude_files = ['.idea', 'copydotfiles.py']


def copy_dotfiles():
    files = os.listdir(src)
    for file in files:
        if file not in exclude_files:
            print('copy ' + file)
            src_file = os.path.join(src, file)
            dest_file = os.path.join(dest, file)
            if os.path.isdir(src_file):
                if os.path.exists(dest_file):
                    shutil.rmtree(dest_file)
                shutil.copytree(src_file, dest_file)
            else:
                if os.path.exists(dest_file):
                    os.remove(dest_file)
                shutil.copy2(src_file, dest_file)


if __name__ == '__main__':
    copy_dotfiles()
    print('done')
