import struct, os, sys

TGA_TYPES = {1:'cmap', 2:'rgb', 3:'gray', 9:'cmap_rle', 10:'rgb_rle', 11:'gray_rle'}

def check(path):
    name = os.path.basename(path)
    size = os.path.getsize(path)
    with open(path, 'rb') as f:
        h = f.read(18)
        img_type = h[2]
        tname = TGA_TYPES.get(img_type, str(img_type))
        if img_type == 78:
            # check if PNG
            f.seek(0)
            sig = f.read(4)
            if sig == b'\x89PNG':
                tname = 'PNG伪装!'
        w = struct.unpack_from('<H', h, 12)[0]
        hh = struct.unpack_from('<H', h, 14)[0]
        bpp = h[16]
        print(f'{name:45s} {size//1024:5d}KB  type={tname}')

base = sys.argv[1] if len(sys.argv) > 1 else r'C:\Users\zhuyinhao01\Documents\我的POPO\testcase_output'
for root, _, files in os.walk(base):
    for f in sorted(files):
        if f.lower().endswith('.tga'):
            check(os.path.join(root, f))
