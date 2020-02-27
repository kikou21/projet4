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
                    //sh "docker build -t logicaldoc ." 
               //}
         
           // }
      //  } 
        
        stage ('run docker-compose and execute tests soapUi in mysqldb '){
            steps {
                script{
                        sh "docker-compose -f docker-compose.yml up -d"
                        sh "sleep 60"
                        sh "cd /home/formation/SmartBear/SoapUI-5.5.0/bin && sh testrunner.sh -s'TestSuite 1' -c'TestCase 1' /var/lib/jenkins/workspace/last/REST-Project-Test-Auto-soapui-project.xml"
                        sh "docker-compose down"
                    }
                }
       }
        stage ('run docker-compose and execute tests soapUi in postgresql '){
            steps {
                script{
                        sh "docker-compose -f docker-compose_2.yml up -d"
                        sh "sleep 60"
                        sh "cd /home/formation/SmartBear/SoapUI-5.5.0/bin && sh testrunner.sh -s'TestSuite 1' -c'TestCase 1' /var/lib/jenkins/workspace/last/REST-Project-Test-Auto-soapui-project-pg.xml"
                        sh "docker-compose -f docker-compose_2.yml down"

                    }
                }
                        
            }
        
        stage ("autom tests "){
            steps {
                script {

                    sh "docker-compose -f docker-compose.yml up -d"
                    sh "docker-compose -f docker-compose_1.yml up -d"
                    sh "docker-compose -f docker-compose_2.yml up -d"
                    sh "docker-compose -f docker-compose_2.yml up -d" 
                    
                }
             
            }
        }
          stage('Deploiement container with tools') {
            ansiblePlaybook (
                playbook: 'ansible-playbooks/tools.yml'
                inventory: "hosts"
                colorized: true, 
                become: true
            )
          }
             
   )
            
          
            
    }
} 
