#!groovy

import jenkins.model.*
import hudson.security.*

def username = System.getenv("JENKINS_USERNAME")
def password = System.getenv("JENKINS_PASSWORD")

def instance = Jenkins.getInstance()

println "--> creating local user 'admin'"

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(username,password)
instance.setSecurityRealm(hudsonRealm)

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)

instance.save()
