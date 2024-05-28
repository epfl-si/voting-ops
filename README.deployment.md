# Set up DELA network

These are the original deployment instruction from dela. 

The instructions must be followed in this exact order, and they must be executed one after the other. It
doesn't matter which node is picked as the initial leader node, but it must remain the same for these instructions.

1. update the images and run the containers:

```
docker-compose pull
docker-compose up -d
```

2. choose an initial leader node - it doesn't matter which one but it must be the same for the rest of the instructions

3. on every node (including the leader node), export the node information:

```
echo "--member $(docker-compose exec dela-worker /bin/bash -c 'LLVL=error dvoting --config /data/node ordering export')"
```

4. *on the leader node only*, run

```
docker-compose exec dela-worker dvoting --config /data/node ordering setup $MEMBERS
```

where you replace `$MEMBERS` by the list of outputs of the previous command

5. on every node (including the leader node), export the public key:

```
docker-compose exec dela-worker crypto bls signer read --path /data/node/private.key --format BASE64_PUBKEY
```

6. on every node (including the leader node) for *each of the public keys*, import it by running:

```
docker-compose exec dela-worker dvoting --config /data/node access add --identity $PUBKEY
```

where you replace `$PUBKEY` by the public key

7. for *each of the public keys*, run *on the leader node only*:

```
docker-compose exec dela-worker dvoting --config /data/node pool add --key /data/node/private.key --args github.com/c4dt/dela.ContractArg --args github.com/c4dt/dela.Access --args access:grant_id --args 0300000000000000000000000000000000000000000000000000000000000000 --args access:grant_contract --args github.com/c4dt/dela.Evoting --args access:grant_command --args all --args access:command --args GRANT --args access:identity --args $PUBKEY
```

where you replace `$PUBKEY` by the public key

# Add an admin user


For each admin that you want to add:

```
docker-compose exec backend npx cli addAdmin --sciper $SCIPER
```

After having added all the admins, restart the backend to clear the cached permissions:

```
docker-compose restart backend
```

# Add voters

1. create a text file (e.g. `voters.txt`) with each sciper that should be allowed to vote on a separate line (make sure that there are no empty lines and no trailing newline characters)
2. copy the file into the Docker container of the backend:

```
docker cp voters.txt $BACKEND:/tmp/voters.txt
```

where $BACKEND is the name of the backend container

3. add the voting permissions by running

```
docker-compose exec backend npx cli addVoters --election-id $FORMID --scipers-file /tmp/voters.txt
```

where you replace `$FORMID` by the election ID that you want to give permission to vote in

4. restart the backend to clear the cached permissions:

```
docker-compose restart backend
```
