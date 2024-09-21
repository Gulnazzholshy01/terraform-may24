data "aws_route53_zone" "hosted_zone" {
    name = "cloudishedu.com"
    private_zone = false
}