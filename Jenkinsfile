pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    if (env.GIT_BRANCH == 'origin/seccond') {
                    sh '''
                    cd /home/jenkins/triotask/flask-app
                    pwd
                    docker build -t gcr.io/lbg-python-cohort-8/rsgflaskapp:latest -t gcr.io/lbg-python-cohort-8/rsgflaskapp:$BUILD_NUMBER .
                    cd /home/jenkins/triotask/db
                    pwd
                    docker build -t gcr.io/lbg-python-cohort-8/rsgflasksql:latest -t gcr.io/lbg-python-cohort-8/rsgflasksql:$BUILD_NUMBER .
                    cd /home/jenkins/triotask/db1
                    pwd
                    docker build -t gcr.io/lbg-python-cohort-8/rsgflasksql1:latest -t gcr.io/lbg-python-cohort-8/rsgflasksql1:$BUILD_NUMBER .
                    '''
                    } else {
                        sh "echo 'Build not required!'"
                    }
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    if (env.GIT_BRANCH == 'origin/seccond') {
                        sh '''
                        docker push gcr.io/lbg-python-cohort-8/rsgflaskapp:latest
                        docker push gcr.io/lbg-python-cohort-8/rsgflaskapp:$BUILD_NUMBER
                        docker push gcr.io/lbg-python-cohort-8/rsgflasksql:latest
                        docker push gcr.io/lbg-python-cohort-8/rsgflasksql:$BUILD_NUMBER
                        docker push gcr.io/lbg-python-cohort-8/rsgflasksql1:latest
                        docker push gcr.io/lbg-python-cohort-8/rsgflasksql1:$BUILD_NUMBER
                        '''
                    } else {
                        sh "echo 'Push not required!'"
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (env.GIT_BRANCH == 'origin/seccond') {
                        sh'''
                        kubectl apply -f . --namespace=dev
                        kubectl rollout restart deployment flaskppd --namespace=dev
                        kubectl rollout restart deployment flasksqld --namespace=dev
                        kubectl rollout restart deployment nginxd --namespace=dev
                        '''
                    } else if (env.GIT_BRANCH == 'origin/master') {
                        sh'''
                        kubectl apply -f . --namespace=prod
                        kubectl rollout restart deployment flaskppd --namespace=prod
                        kubectl rollout restart deployment flasksqld --namespace=prod
                        kubectl rollout restart deployment nginxd --namespace=prod
                        '''
                    } else {
                        sh'''
                        echo "unrecognised branch"
                        '''
                    }
                }
            }
        }
        stage('Clean Up') { 
            steps {
                sh '''
                docker system prune -a --force
                '''
            }
        }
    }
}