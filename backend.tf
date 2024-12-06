terraform { 
  backend "remote" { 
    
    organization = "terraform-cloud-cli" 

    workspaces { 
      name = "terraform-infra-cli" 
    } 
  } 
}