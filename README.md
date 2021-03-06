# igentify_Challenge
Create a small project (Any language any stack) and build a CI/CD pipeline for it.

 
## Introduction
The project implies Python application: Flask with Redis back-end. Application has been grabbed here https://docs.docker.com/compose/gettingstarted/ 
CI implies GitHub as code repository and Travis CI platform to run build and integration tests.
Code delivery into repository triggers build in Travis CI. 
CD stage deploys application into Google Cloud Platform upon success of the build. Deployment stage runs upon code delivery into 'master' branch aka 'newmaster'


## Steps to set CI

In Github create and configure new integration with Travis CI. 
The project employs docker-compose for integration test. Have to prepare corresponding docker-compose.yml

## Steps to set CD

Have to create dedicated GKE cluster and update with regarding details the section 'before_install:' of .travis.yml 

**NOTE** 
* Have to create GPC service user
Grant Role of Kubernetes engine and create GPC service user
Upload encripted key to Travis CI:
1) install Travis CLI
- _docker run -ut -v $(pwd):/app ruby:2.5 sh_
_gem install travis_
_trvais login_
- copy json file to 'volumed' directory
_travis encrypt-file <service account.json> -r repository/project_
_root@44968d734b08:/# travis login --pro  --github-token xxxxxxxxx_
_Successfully logged in as vbronfman!_
_root@44968d734b08:/# travis encrypt-file igentify-challenge.json igentify-challenge.json.enc -I --pro --repo vbronfman/igentify_Challenge **--print-key**_
encrypting igentify-challenge.json for vbronfman/igentify_Challenge
_storing result as igentify-challenge.json.enc_
=======

## Steps to set CI

**NOTE** 

Create GPC service user
Grant Role of Kubernetes engine
Upload encripted key to Travis CI:
1) install Travis CLI
- docker run -ut -v $(pwd):/app ruby:2.5 sh
gem install travis
trvais login
copy json file to 'volumed' directory
travis encrypt-file <service account.json> -r repository/project 
root@44968d734b08:/# travis login --pro  --github-token 49dbfe5c4510696a08e3cf91
8c40669de073394e
Successfully logged in as vbronfman!
root@44968d734b08:/# travis encrypt-file /tmp/igentify-challenge-15bb3352337c.js
on  -r vbronfman/igentify_Challenge
encrypting /tmp/igentify-challenge-15bb3352337c.json for vbronfman/igentify_Chal
lenge
storing result as igentify-challenge-15bb3352337c.json.enc
>>>>>>> 9d86937... Travis CI encriptes key added
storing secure env variables for decryption

Please add the following to your build script (before_install stage in your .tra
vis.yml, for instance):

     openssl aes-256-cbc -K $encrypted_115895d8_key -iv $encrypted_651c115895d8_iv -in igentify-challenge.json.enc -out igentif

key: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
iv:  XXXXXXXXXXXXXXXXXXXXXXXX

Make sure to add igentify-challenge.json.enc to the git repository.
Make sure not to add /tmp/igentify-challenge.json to the git repository.
_Commit all changes to your .travis.yml._
**NOTE** 
-print-key - prints value of encrypted_115895d8_key and $encrypted_651c115895d8_iv. In my case CLI didn't create these variables automaticaly so I've added them manually.

* Create DOCKER_PASSWORD and DOCKER_USER environment variables in Travis CI

* Due to Travis CI has no predefined API, the project uses propriatary script `./deploy.sh` 
=======
    openssl aes-256-cbc -K $encrypted_651c115895d8_key -iv $encrypted_651c115895
d8_iv -in igentify-challenge-15bb3352337c.json.enc -out /tmp/igentify-challenge-
15bb3352337c.json -d

Pro Tip: You can add it automatically by running with --add.

Make sure to add igentify-challenge-15bb3352337c.json.enc to the git repository.
Make sure not to add /tmp/igentify-challenge-15bb3352337c.json to the git reposi
tory.
Commit all changes to your .travis.yml.

Build fired upon pull request to masternew
