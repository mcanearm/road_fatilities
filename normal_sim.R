crss <- read.csv("./data/CRSS2022CSV/vpicdecode.csv")
fars <- read.csv("./data/FARS2022NationalCSV/vpicdecode.csv")


fatal_hp = fars[!is.na(fars["ENGINEBRAKEHP_FROM"]), "ENGINEBRAKEHP_FROM"]
nonfatal_hp = crss[!is.na(crss["EngineBrakeHP_From"]), "EngineBrakeHP_From"]

upper_limit <- quantile(c(fatal_hp, nonfatal_hp), 0.999)

fatal_hp <- fatal_hp[which(fatal_hp < upper_limit)]
nonfatal_hp <- nonfatal_hp[which(nonfatal_hp < upper_limit)]


prior_alpha <- 2
prior_beta <- 50
