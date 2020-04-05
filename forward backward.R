#FORWARD/BACKWARD
fit.full <- lm(moisture ~ .,data=treemoist.dat)
for.aic <- step(lm(moisture ~ 1, data = treemoist.dat), direction = "forward", scope = formula(fit.full), k = 2, trace = 0)    
for.bic <- step(lm(moisture ~ 1, data=treemoist.dat), direction = "forward", scope = formula(fit.full), k = log(32), trace = 0)         # forward BIC
back.aic <- step(fit.full, direction = "backward", k = 2, trace = 0)        # backward AIC
back.bic <- step(fit.full, direction = "backward", k = log(32), trace = 0)  # backward BIC
