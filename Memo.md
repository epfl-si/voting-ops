# Next Gen eVoting deployment

https://github.com/dedis/

https://github.com/dedis/d-voting

https://dedis.github.io/d-voting/#/


https://github.com/dedis/d-voting/tree/main/deb-package/pkg/opt/dedis/dvoting/bin



### Setup of nodes
 - download the node binary from [releases][releases]. It's a go binary so no special requirements;


./memcoin-linux-amd64-v0_4_5-alpha --config data ordering export

./memcoin-linux-amd64-v0_4_5-alpha --config data ordering setup --member Rml0c2V2b3RpbmcwMDAzLnhhYXMuZXBmbC5jaDoyMDAw:cllVIVbZLYo0zL2Qi7NeYMFj4Tgb40ygnQ/m6IBkwVY0HtSySeMVughFso/FHoK7HdyMHYMptBfTvBOpHjqwwlrtXeaNR/XC0jLbGv3D7v/3DjfLcy4KGEAggkK0go9HL6ebkI14sdzXThz8MaOc51mE+Dexx7O7N/pk0vVX+qo= --member Rml0c2V2b3RpbmcwMDA0LnhhYXMuZXBmbC5jaDoyMDAw:cKmrUzRznxx/0R6HQk8IEOt7/ba5osBEUS9F21hZhgtSiyqpopxa4gob2FWotnQnuknF1+R3QrnWjTAp6bNJuV52oWwwCR2nP6Enq6KRSdqkSGTNxkyiK0ylJ5CSUJ1yWULXRNohgMiFRFFsoeV86Mj+HXEyr3PrVErUPfD0m8E= --member Rml0c2V2b3RpbmcwMDA1LnhhYXMuZXBmbC5jaDoyMDAw:AHdQdwziQL1QDI2fN4k8j0zEr17hxFhaHe3HCn4zbI0CcnhX7SmzhtoMeX7PGOY5MSrFgon7OB/sfkdhrKtWUUytFBKIxkMAT3cxzzzFd+OpgSc8R1L30sxrD3fN0C7jeiCB1E+xPNw8pDRrkeQG0iT9AuE92lWg9DdmXMqnPaE=


### Authorize each node to submit transactions to the BC
./enable_submit 

in the logs:
```
2022-11-29T11:11:57Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/core/ordering/cosipbft/mod.go:412 > node has started following the chain addr=itsevoting0003.xaas.epfl.ch:2000
2022-11-29T11:11:57Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/core/ordering/cosipbft/mod.go:279 > new chain has been created addr=itsevoting0003.xaas.epfl.ch:2000 digest=d4bb1ce6 roster=3
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/contracts/access/mod.go:175 > granted 0300000000000000000000000000000000000000000000000000000000000000-go.dedis.ch/dela.Evoting-all to [bls:7259552156d92d8a] contract=access
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/contracts/access/mod.go:175 > granted 0300000000000000000000000000000000000000000000000000000000000000-go.dedis.ch/dela.Evoting-all to [bls:7259552156d92d8a] contract=access
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/core/ordering/cosipbft/pbft/mod.go:390 > finalize round with leader: 0
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/core/ordering/cosipbft/mod.go:387 > block event addr=itsevoting0003.xaas.epfl.ch:2000 index=0 root=98019eed
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/contracts/access/mod.go:175 > granted 0300000000000000000000000000000000000000000000000000000000000000-go.dedis.ch/dela.Evoting-all to [bls:70a9ab5334739f1c] contract=access
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/contracts/access/mod.go:175 > granted 0300000000000000000000000000000000000000000000000000000000000000-go.dedis.ch/dela.Evoting-all to [bls:007750770ce240bd] contract=access
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/contracts/access/mod.go:175 > granted 0300000000000000000000000000000000000000000000000000000000000000-go.dedis.ch/dela.Evoting-all to [bls:70a9ab5334739f1c] contract=access
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/contracts/access/mod.go:175 > granted 0300000000000000000000000000000000000000000000000000000000000000-go.dedis.ch/dela.Evoting-all to [bls:007750770ce240bd] contract=access
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/core/ordering/cosipbft/pbft/mod.go:390 > finalize round with leader: 0
2022-11-29T11:23:11Z INF home/runner/go/pkg/mod/go.dedis.ch/dela@v0.0.0-20221010131641-9c479e68be18/core/ordering/cosipbft/mod.go:387 > block event addr=itsevoting0003.xaas.epfl.ch:2000 index=1 root=c6681302

```


NODE_ENV=production PORT=6000 NODE_PATH=$PWD/node_modules ../node-v18.12.1-linux-x64/bin/node Server.js



# add admins to the backend database
NODE_PATH=$PWD/node_modules  ../node-v18.12.1-linux-x64/bin/node -e 'require("./dbUtils").listEls("/home/ubuntu/data/dvoting-users")' 


ubuntu@itsevoting0006:~/web-backend-v0_4_5-alpha$ NODE_PATH=$PWD/node_modules  ../node-v18.12.1-linux-x64/bin/node -e 'require("./dbUtils").listEls("/home/ubuntu/data/dvoting-users")' 
ubuntu@itsevoting0006:~/web-backend-v0_4_5-alpha$ NODE_PATH=$PWD/node_modules  ../node-v18.12.1-linux-x64/bin/node -e 'require("./dbUtils").addAdmin("/home/ubuntu/data/dvoting-users", 121769)' 
ok
ubuntu@itsevoting0006:~/web-backend-v0_4_5-alpha$ NODE_PATH=$PWD/node_modules  ../node-v18.12.1-linux-x64/bin/node -e 'require("./dbUtils").listEls("/home/ubuntu/data/dvoting-users")' 
'121769' => 'admin' 	 | 	  (string) => (string)




releases: https://github.com/dedis/d-voting/releases 
