import torch
print("Hello World!")
print(torch.cuda.is_available())

print(torch.cuda.device_count())

# Which GPU Is The Current GPU?
print(torch.cuda.current_device())

# Get the name of the current GPU
print(torch.cuda.get_device_name(torch.cuda.current_device()))
