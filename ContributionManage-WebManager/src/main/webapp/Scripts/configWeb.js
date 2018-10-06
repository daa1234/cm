Config_91Baby = {
	 config_domain_name:"http://www.91baby.cn"
//	config_domain_name : "http://192.168.1.150:8080" Config_91Baby.config_domain_name
}
if ("91baby.cn" == location.hostname) {
	Config_91Baby.config_domain_name = "http://91baby.cn"
} else if ("www.91baby.cn" == location.hostname) {
	Config_91Baby.config_domain_name = "http://www.91baby.cn"

}