import os

# Define the directory structure as a list of tuples to avoid syntax issues
structure = [
     ("terraform_project", ["main.tf", "variables.tf", "outputs.tf", "provider.tf"]),
     ("terraform_project/modules/vpc", ["main.tf", "variables.tf", "outputs.tf"]),
     ("terraform_project/modules/subnet", ["main.tf", "variables.tf", "outputs.tf"]),
     ("terraform_project/modules/nat_gateway", ["main.tf", "variables.tf", "outputs.tf"]),
     ("terraform_project/modules/ec2", ["main.tf", "variables.tf", "outputs.tf"]),
     ("terraform_project/modules/rds", ["main.tf", "variables.tf", "outputs.tf"]),
     ("terraform_project/modules/alb", ["main.tf", "variables.tf", "outputs.tf"]),
     ("terraform_project/modules/bastion_host", ["main.tf", "variables.tf", "outputs.tf"])
]

# Function to create directories and files
def create_structure(structure):
     for dir_path, files in structure:
          os.makedirs(dir_path, exist_ok=True)
          
          for file in files:
               file_path = os.path.join(dir_path, file)
               with open(file_path, 'w') as f:
                    f.write(f"# {file} content for {os.path.basename(dir_path)}\n")

# Run the function to create the structure
create_structure(structure)

print("Terraform project structure created successfully.")
