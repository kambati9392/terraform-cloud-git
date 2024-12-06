vpc_cidr_block = "10.0.0.0/16"

terraform_vpc_name = "dev_vpc"

igw-name = "ws-dev-igw"

public_subnet_cidr_1 = "10.0.0.0/18"
public_subnet_az_1 = "ap-southeast-1a"
public_subnet_1_name = "ws-dev-pubsub-1"

public_subnet_cidr_2 = "10.0.64.0/18"
public_subnet_az_2 = "ap-southeast-1b"
public_subnet_2_name = "ws-dev-pubsub-2"

private_subnet_cidr_1 = "10.0.128.0/18"
private_subnet_az_1 = "ap-southeast-1a"
private_subnet_1_name = "ws-dev-prisub-1"

private_subnet_cidr_2 = "10.0.192.0/18"
private_subnet_az_2 = "ap-southeast-1b"
private_subnet_2_name = "ws-dev-prisub-2"

all_traffic = "0.0.0.0/0"
ws-pub-route-table = "ws-dev-pub-route-table"
ws-pri-route-tabled = "ws-dev-pri-route-table"

ws-nat-gate-way="ws-dev-natgateway"
