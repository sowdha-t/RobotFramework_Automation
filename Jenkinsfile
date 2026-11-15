pipeline{
    agent any

    //Automatically clean old builds
    options{
        buildDiscarder(logRotator(
            numToKeepStr: '5',  //keeps only last 5 builds and discard the older one
            artifactNumToKeepStr: '3' //keep artifact HTML Reports only for the last 3 disableConcurrentBuilds()
        )
        )

    }
    stages  {
        stage('Clean Workspace'){
            steps{
            //Delete previous runs before starting fresh
            cleanWs()
            }

        }
        stage('Checkout'){
            steps {
                //pulls the latest code from the branch configured in Jenkins
                echo "Fetch the code"
                checkout scm
            }
        }

        stage('Install Dependencies'){
            steps  {
                echo "Install Dependencies"
                //Robot framework and required dependencies are installed
                bat 'pip install -r requirements.txt'
            }
       }

       stage('Run Robot Tests') {
           steps{
                echo "Run Automated Scripts"
                bat 'robot -d results tests/'
            }
       }

    }

    post{
        always{
        //save everything inside the results folder
        archiveArtifacts artifacts: 'results/**/*', allowEmptyArchive: true
        }
    }

}