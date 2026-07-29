resource "aws_vpc_peering_connection" "pathnex_peering" {
  vpc_id      = "vpc-12345678"
  peer_vpc_id = "vpc-87654321"

  tags = {
    Name = "pathnex-peering"
  }
}

resource "aws_route" "pathnex_route" {
  route_table_id             = "rtb-12345678"
  destination_cidr_block     = "10.0.0.0/16"
  vpc_peering_connection_id  = aws_vpc_peering_connection.pathnex_peering.id
}