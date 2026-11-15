pipeline{
    agent any
    stages  {
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

}