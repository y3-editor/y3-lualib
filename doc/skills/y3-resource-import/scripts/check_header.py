import sys
path = sys.argv[1]
with open(path, 'rb') as f:
    head = f.read(16)
print(f'Header hex: {head.hex()}')
print(f'First 4 bytes as text: {head[:4]}')
