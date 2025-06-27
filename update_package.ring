/*
	This File Created for updating the package.ring file to avoid missing the new files
	made by : Mohannad Alayash
*/
/*
	Vars in Templte : 
	1- <T_aFilesList>
	2- <T_cPackageVersion>
*/
load 'stdlibcore.ring'

cTemplate = read('package.ring.template')
cContent = cTemplate

aFilter = [] // 'Var For Filtering ...'


aPackageFiles = [] // 'List Will Contains All Files For Package'
aPackageFiles + 'main.ring'
aPackageFiles + 'README.md'

# 'Adding The qtproject files'
	aFiles = listallfiles('qtproject','')
	addNow(aFiles)

# 'Adding The Src files'
	aFiles = listallfiles('Src','*.ring')
	aFilter + 'Src/target'
	aFilter + 'Src/build_ws.ring'

	addNow(aFiles)

	# 'Adding images'
		aFiles = listallfiles('Src','*.png')
		addNow(aFiles)
	# 'Adding fonts'
		aFiles = listallfiles('Src','*.ttf')
		addNow(aFiles)


	# 'Setting the content'
		setContent('<T_aFilesList>',listfiles2codewithformat(aPackageFiles))
		setContent('<T_cPackageVersion>','1.1.0')

	# 'Update package.ring File'
		writeComment()


func setContent cVar,cCont
	cContent = substr(cContent,cVar,cCont)
func writeComment
	write('package.ring',cContent)	

func listfiles2codewithformat alist 

	cStr = '['+nl
	for item in alist
		cStr+= copy(tab,2)+'"'+item+'",'+nl
	next
	cStr = left(cStr , len(cStr)-2)+nl
	cStr += copy(tab,1)+']'
	return cStr
func addNow aList
	? copy('-',40)
	? 'Adding...'
	map(alist , func item{
		if isFilter_accepted(item)
			aPackageFiles + item
		else
			? 'Skipping : '+item
		ok
	})
func isFilter_accepted item
	for cfilter in aFilter
		if substr(item ,cfilter)
			return 0
		ok
	next
	return 1
