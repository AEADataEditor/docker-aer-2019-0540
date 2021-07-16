# Building and running Docker for this project

This Docker image was used to re-run the code for AER-2019-0540 entitled "Market Entry, Fighting Brands and Tacit Collusion: Evidence from the French Mobile Telecommunications Market." 

- Code associated with the paper: [http://doi.org/10.3886/E138921V1](http://doi.org/10.3886/E138921V1)

> [NOTE] At the time this code was executed, the AEA Data Editor had access to private/commercial data not part of the replication package. Interested replicators should consult the README in the replication package.

## Build

```shell
DOCKER_BUILDKIT=1 docker build . -f Dockerfile -t aeadataeditor/aer-2019-0540:20210629
```

## Run

Change to the root of the project (you should see "data", "code", "workfiles", "work").
Ensure that the `~/work/kantar/brand/workfiles` data are present under `work/kantar/brand/workfiles`. 

You might need to make adjustments to `estim/Helper.jl`:

```diff
--- a/138921/code/estim/Helper.jl
+++ b/138921/code/estim/Helper.jl
@@ -13,8 +13,9 @@ function importData(
   ver    ::String,  # Version of estimation data (824 for final version)
   impFile::String;  # Type of import files (corresponding to model & IV)
   output ::Int64=1) # Type of function output
-
-  workPath = "$(homedir())/work/kantar/brand/workfiles/"
+  
+  prefix = "/workdir/aearep-2120/138921"
+  workPath = string(prefix,"/work/kantar/brand/workfiles/")
 
   if (impFile=="base") | (impFile=="optIVtest") | (impFile=="optIV2")
     fileD = string(workPath,"demand",ver,".csv")
@@ -166,7 +167,8 @@ function config!(
   lowBoundOn::Bool=false,
   truncate  ::Bool=false)
 
-  workPath = "$(homedir())/work/kantar/brand/workfiles/simdraws/"
+  prefix = "/workdir/aearep-2120/138921"
```

Run the docker image with

```shell
docker run -it -v $(pwd):/workdir/aearep-2120/138921 \
     -w /workdir/aearep-2120/138921/code/estim \
     aer-2019-0540:20210624 julia -O3 -p 20 mainmulti.jl
```
