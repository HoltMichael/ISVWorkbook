sfdx force:org:create -f config/project-scratch-def.json -a accelerateScratch --setdefaultusername -s -d 2

sfdx force:source:push 

sfdx force:user:permset:assign -n Property_Manager

sfdx force:data:tree:import -f data/properties.json

sfdx force:org:open