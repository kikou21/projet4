pipeline {
    agent any
    
    stages{
     /*    stage ('pull the logicaldoc image'){
            steps {
                script {
                 /*    withCredentials([usernamePassword(credentialsId: 'gitPackageTokens', passwordVariable: 'GIT_TOKEN', usernameVariable: 'GIT_USERNAME')]){
                        sh "docker login -u ${GIT_USERNAME} - p ${GIT_TOKEN} https://github.com/kikou21/projet4/packages docker.pkg.github.com"
                        sh "docker pull docker.pkg.github.github.com/${GIT_USERNAME}/projet4/logicaldoc:latest"
                        sh "docker images"
                        }  */
                    sh "docker build -t logicaldoc ." 
                }
         
            }
        } 
        
       stage ('run docker-compose and tests  '){
            steps {
                parallel (
                   logicaldocMdb : {
                        script{
                            sh "docker-compose up"
                            sh "docker ps"
                            //sh "" to do executer le script sql de peuplement de la bdd après avoir ouvert le container
                            //sh ""
                            //sh "docker-compose down"
                        }
                    },
                    logicaldocPG : {
                        script{
                            sh "echo 'test' "
                            /* sh "cd postgres"
                            sh "docker-compose up"
                            sh "docker ps"
                            //sh "" to do executer le script sql de peuplement de la bdd après avoir ouvert le container
                            //to do ajouter soapui free et  lancer fichier xml
                            sh "docker-compose down" */

                         }
                    }
                )         
            }
        }
        
        stage ("manual tests "){
        
            }
            steps {
               sh "docker build -t mytools -f deb.Dockerfile ." 
                
            
            }
        }   
            
    }
} 
