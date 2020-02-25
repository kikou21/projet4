pipeline {
    agent { any}
    
    stages{
       stage ('build image'){
           steps {
                docker build -t logicaldoc .


               sh docker
            withCredentials([usernamePassword(credentialsId: 'GitCredentials', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]){
                docker build -t docker.pkg.gihub.com/${GIT_USERNAME}/Projet4.git/lof
                
                    }
       }
    

        sh './gradlew test -PNEXUS_USERNAME=${NUSER} -PNEXUS_PASSWORD=${NPASS}'
    }
}
           steps {
             sh "docker build -t docker.pkg.gihub.com/kikou21         }
       }

       }

    }