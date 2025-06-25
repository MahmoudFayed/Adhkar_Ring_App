/*
	This File Created for updating the package.ring file to avoid missing the new files
	made by : Mohannad Alayash
*/
/*
	Vars in Templte : 
	1- <T_aFilesList>

*/
load 'stdlibcore.ring'

cTemplate = read('package.ring.template')

cFilter = '' // 'Var For Filtering ...'
aPackageFiles = [] // 'List Will Contains All Files For Package'
aPackageFiles + 'main.ring'
aPackageFiles + 'README.md'

# 'Adding The qtproject files'
	aFiles = listallfiles('qtproject','')
	addNow(aFiles)

# 'Adding The Src files'
	cFilter = 'Src/target'
	aFiles = listallfiles('Src','*.ring')
	addNow(aFiles)

	# 'Adding images'
		aFiles = listallfiles('Src','*.png')
		addNow(aFiles)
	# 'Adding fonts'
		aFiles = listallfiles('Src','*.ttf')
		addNow(aFiles)
	# 'Restore filter'
		cFilter = ''


	cTemplate = substr( cTemplate ,'<T_aFilesList>' ,listfiles2codewithformat(aPackageFiles))

	# 'Update package.ring File'
		write('package.ring',cTemplate)	

func listfiles2codewithformat alist 
	cStr = '['+nl
	for item in alist
		cStr+= copy(tab,2)+'"'+item+'",'+nl
	next
	cStr = left(cStr , len(cStr)-2)+nl
	cStr += copy(tab,1)+']'
	return cStr
func addNow aList
	for item in alist
		if cFilter = "" or (cFilter != '' and ! substr(item , cFilter))
			aPackageFiles + item
		else
			? 'Skipping : '+ item
		ok
	next

