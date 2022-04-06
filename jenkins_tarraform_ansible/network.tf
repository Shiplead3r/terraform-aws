resource "aws_vpc" "vpc_master" {
  provider = aws.region-master
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
      Name = "master-vpc-jenkins"
  }
}
resource "aws_vpc" "vpc_worker" {
    provider = aws.region-worker
    cidr_block = "192.168.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "worker-vpc-jenkins"
    }
}

resource "aws_internet_gateway" "igw-master" {
    provider = aws.region-master
    vpc_id = aws_vpc.vpc_master.id
  
}
resource "aws_internet_gateway" "igw-worker" {
  provider = aws.region-worker
  vpc_id = aws_vpc.vpc_worker.id
}

data "aws_availability_zones" "azs-master" {
    provider = aws.region-master
    state = "available"
}
resource "aws_subnet" "subnet_1" {
  provider = aws.region-master
  availability_zone = element(data.aws_availability_zones.azs-master.names,0)
  vpc_id = aws_vpc.vpc_master.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "subnet_2" {
  provider = aws.region-master
  availability_zone = element(data.aws_availability_zones.azs-master.names,1)
  vpc_id = aws_vpc.vpc_master.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "subnet_3" {
  provider = aws.region-worker
  vpc_id = aws_vpc.vpc_worker.id
  cidr_block = "192.168.1.0/24"
}