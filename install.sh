### setup ###
mode="dev"
mode="pro"
#############


echo npm run $mode
#npm run $mode
npm run stop 2>/dev/null

config_file_name="config.development.json"
if [ $mode = "pro" ]; then config_file_name="config.production.json"; fi
project_name=$(echo `pwd` | awk -F "/" '{print $NF}' | awk -F "-project" '{print $1}')
cp $project_name/$config_file_name $project_name/$config_file_name.old
path=$(echo `pwd` | sed "s/\//\\\\\//g") && sed "s/contentPath.*\"/contentPath\": \"$path\/content\"/g" $project_name/$config_file_name.old > $project_name/$config_file_name
echo update config: $project_name/$config_file_name
echo set configure.contentPath: `pwd`/content