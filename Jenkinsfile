#!/usr/bin/env groovy
def runme
node('knife-lxd') {
    dir( 'src' ){
        checkout scm
        sh 'git submodule update --init'
        runme = load '.jenkins/Jenkinsfile'
        runme.go()
    }
}
