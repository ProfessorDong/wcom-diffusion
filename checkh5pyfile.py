#pip install h5py

import h5py

def print_hdf5_structure_and_types(file_path):
    def print_attrs(name, obj):
        print(f"{name} ({type(obj)})")
        if isinstance(obj, h5py.Dataset):
            print(f"  Data type: {obj.dtype}")
            print(f"  Shape: {obj.shape}")
    
    with h5py.File(file_path, 'r') as f:
        print("HDF5 File Structure and Data Types:")
        f.visititems(print_attrs)

# Example usage
file_path = 'data/Vaihingen/full_training_vaih.hdf5'  # Replace with your HDF5 file path
print_hdf5_structure_and_types(file_path)