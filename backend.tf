terraform { 
  backend "remote" { 
    
    organization = "terraform-cloud-git" 

    workspaces { 
      name = "terraform-cloud-git" 
    } 
  } 
}