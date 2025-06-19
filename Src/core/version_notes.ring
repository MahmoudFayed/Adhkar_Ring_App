cVersion = '1.2.2'
cVersion_notes_btnText='الإصـــدار: '
cVersion_notes_btnText += cVersion
cVersion_notes_btnText += nl
cVersion_notes_btnText += 'إضغط لعرض المزيد'
cVersion_note_detailes = ''

cVersion_note_detailes += get_Version_note('1.2.1','16/06/2025',
[
'إضافة اذكار النوم.',
'تحسين ميزة التنقل من خلال الغاء التنقل بالسحب وابقاء التنقل من خلال الشريط الجانبي'
])



func get_Version_note cVersion,cDate,aInfo

cText = `<h3>`
cText += 'الإصدار :'
cText += cVersion
cText += '</h3><h4>'
cText += 'التاريخ :'
cText += '<b>'+cDate+'</b>'
cText += '</h4><hr / >'
cText += '<p>
في هذا التحديث قمنا بالتالي:
<ul>'
for x=1 to len(aInfo)
	cText += '<li>'+aInfo[x]+'</li>'
next
cText += '</ul></p><p style="color:yellow;">------------------------------------------</p>'

	return cText
