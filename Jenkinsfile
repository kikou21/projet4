pipeline {
    agent { any}
    
    stages{

exemple one :

        stage('Deploiement Ansible') {
            ansiblePlaybook (
                playbook: 'ansible-playbooks/mariadb.yml'
                inventory: "hosts"
                extras: '--extra-vars "variable_host=${HOSTNAME} variable_dbrootpassword=${ROOTPASSWORD} variable_dbname=${DBNAME} variable_dbuser=${DBUSER} variable_dbpass=${DBPASS} ansible_ssh_user=$SUDOERLOGIN ansible_ssh_pass=$SUDOERPASS ansible_sudo_pass=$SUDOERPASS"'
                colorized: true, 
                become: true,
             
   )
}

 /* ansiblePlaybook(
	              installation: 'Centos 7 ansible (system package)',
	              playbook: 'playbooks_os/create.yml',
	              inventory: "hosts",
	              credentialsId: 'deploy_centos',
	              limit: "vitam",
	              extras: '--vault-password-file password_file.txt -e state=absent -vvv',
                colorized: true
	            ) */

       stage ('pull the logicaldoc image'){
           steps {
            
            withCredentials([usernamePassword(credentialsId: 'gitPackageTokens', passwordVariable: 'GIT_TOKEN', usernameVariable: 'GIT_USERNAME')]){
                docker login -u ${GIT_USERNAME} - p ${GIT_TOKEN} docker.pkg.github.com
                docker pull docker.pkg.github.github.com/${GIT_USERNAME}/projet4/logicaldoc:latest
                }
            }
     }
       }

       }

    }