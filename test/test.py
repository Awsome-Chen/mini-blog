
import sys
import hashlib
import sys

if __name__ == '__main__':
    content = "hello"
    md5hash = hashlib.md5(content.encode("utf-8"))
    md5 = md5hash.hexdigest()
    print(md5)