# igentify_Challenge
Create a small project (Any language any stack) and build a CI/CD pipeline for it.


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
storing secure env variables for decryption

Please add the following to your build script (before_install stage in your .tra
vis.yml, for instance):

    openssl aes-256-cbc -K $encrypted_651c115895d8_key -iv $encrypted_651c115895
d8_iv -in igentify-challenge-15bb3352337c.json.enc -out /tmp/igentify-challenge-
15bb3352337c.json -d

Pro Tip: You can add it automatically by running with --add.

Make sure to add igentify-challenge-15bb3352337c.json.enc to the git repository.
Make sure not to add /tmp/igentify-challenge-15bb3352337c.json to the git reposi
tory.
Commit all changes to your .travis.yml.


