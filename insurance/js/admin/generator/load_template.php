<?	if (isset($dwshow)){?><script><? }
ob_start();?>
// JavaScript Document
//
function cancelTemplateChanges(btn){
  try{
	tmplSchema=tmplSchemaSaved; // возвернуть!
	stateTemplateIsLoaded();
  }catch(e){
	  alert(e.message);
  }
}
// кнопка.click изменить шаблон
function changeTemplate(btn){ 
  try{
	tmplSchemaSaved=tmplSchema; // сохранить выбранную схему
	// кнопки:
	setButtonStat([btn.id],'passive'); // пассивна
	setButtonStat(['btn_cancelTemplateChanges'],'active'); // активна
	display(['choice_init']); // отобразить блок первоначального выбора
	makeSolid(['choice_init']); // непрозрачный: блок первоначального выбора
	makeLiquid(['tmplPlace','sel_modules']); // полупрозрачные: блок макета, модули
  }catch(e){
	  alert(e.message);
  }
}
//
function createTemplate(tmplSchema,goLoop){
  try{ //alert(tmplSchema);	
  	// получить количество блоков:
	var colsCountInit=colsCount=parseInt(tmplSchema.substring(0,1));
	var tmplValue2=tmplSchema.substring(1,2);
	var tmplValue3=tmplSchema.substring(2);
	if (tmplValue2!='0') colsCount+=1;
	if (tmplValue3!='0') colsCount+=1;
	var tmplBlock='<div class="first" onClick="selectColumn(event,this);">';
	for (i=0;i<colsCount;i++){
		tmplBlock+='	<div';
		if (i==0) { // первая итерация:
			if (colsCountInit!=1) {
				tmplBlock+=' class="';
				tmplBlock+=(colsCountInit==4)? 'column4':'left'+colsCountInit;
				tmplBlock+='"';
			}
			tmplBlock+=' left';	
		}else{ // разобраться с остальными колонками:
			tmplBlock+=' class="';
			switch(i){
				
				case 1: // 2-й блок
					
					switch(tmplSchema){ // назначаем первый класс:
						case '3i0':
							tmplBlock+='header3inside';
								break;
						case '4i0':
						case '4ii':
							tmplBlock+='hf4Inside';
								break;
						case '3s0':
						case '3ss':
							tmplBlock+='hf3Shared';
								break;
						case '4s0':
						case '4ss':
							tmplBlock+='hf4Shared';
								break;
						case '200':
						case '210':
							tmplBlock+='right2';
								break;
						case '300':
						case '30s':
							tmplBlock+='column3center';
								break;
						case '400':
						case '40s':
							tmplBlock+='column4';
								break;
						case '40i':
							tmplBlock+='column4last';
								break;
					}
					switch(tmplSchema){	// добавляем второй класс:
						case '200':
						case '300':
						case '400':
						case '40i':
							tmplBlock+=' hFull';
								break;
						case '30s':
						case '40s':
							tmplBlock+=' hColMiddle';
								break;
					}
					
					tmplBlock+='"'; // дописываем закрывающую кавычку классов
					switch(tmplSchema){ // добавить атрибут блока для идентификации CSS:
						case '210':
						case '3i0':
						case '3s0':
						case '3ss':
						case '4i0':
						case '4ii':
						case '4s0':
						case '4ss':
							tmplBlock+=' header';
								break;
						case '300':
						case '400':
							tmplBlock+=' left';
								break;
						case '200':
						case '40i':
						case '4ii':
						case '4ss':
							tmplBlock+=' right';
								break;
					}
				
				break;
					
				case 2: // 3-й блок
					
					switch(tmplSchema){ // назначаем первый класс:
						case '210':
							tmplBlock+='hColMiddleLong';
								break;
						case '300':
						case '3i0':
						case '30s':
						case '3s0':
							tmplBlock+='column3right';
								break;
						case '3ss':
							tmplBlock+='column3center';
								break;
						case '400':
						case '40i':
						case '40s':
						case '4ss':
							tmplBlock+='column4';
								break;
						case '4i0':
						case '4ii':
						case '4s0':
							tmplBlock+='column4last';
								break;
					}
					switch(tmplSchema){ // добавляем второй класс:
						case '210':
							tmplBlock+=' right2';
								break;
						case '300':
						case '3i0':
						case '400':
						case '4i0':
						case '4ii':
							tmplBlock+=' hFull';
								break;
						case '30s':
						case '4s0':
						case '40s':
						case '40i':
							tmplBlock+=' hColMiddle';
								break;						
						case '3s0':
							tmplBlock+=' hColMiddleLong';
								break;						
						case '3ss':
						case '4ss':
							tmplBlock+=' hColShort';
								break;
					}
					
					tmplBlock+='"'; // дописываем закрывающую кавычку классов
					switch(tmplSchema){ // добавляем атрибут для CSS:
						case '210':
						case '300':
						case '3i0':
						case '30s':
						case '3s0':
						case '4ii':
						case '4s0':
							tmplBlock+=' right';
								break;
					}
				
				break;
				
				case 3: // 4-й блок
					
					switch(tmplSchema){ // назначить первый класс:
						case '3i0':
						case '3s0':
							tmplBlock+='column3center';
								break;
						case '400':
						case '4i0':
						case '4s0':
						case '40i':
						case '4ii':
						case '4ss':
							tmplBlock+='column4';
								break;
						case '40s':
							tmplBlock+='column4last';
								break;
						case '30s':
							tmplBlock+=' hf3Shared';
								break;
						case '3ss':
							tmplBlock+=' column3right';
								break;
					}
					switch(tmplSchema){ // добавить второй класс:
						case '40i':
						case '40s': 
							tmplBlock+=' hColMiddle';
								break;
						case '3s0': 
						case '3i0': 
						case '4i0': 
						case '4s0': 
							tmplBlock+=' hColMiddleLong';
								break;
						case '3ss':
						case '4ii':
						case '4ss':
							tmplBlock+=' hColShort';
								break;
						case '400':
							tmplBlock+=' hFull';
								break;
					}
					
					tmplBlock+='"'; // дописываем закрывающую кавычку классов
					switch(tmplSchema){ // добавить атрибут для CSS:
						
						case '30s':
							tmplBlock+=' footer';
								break;
						case '400':
						case '3ss':
							tmplBlock+=' right';
								break;
					}
				
				break;
				
				case 4: // 5-й блок
					
					switch(tmplSchema){ // назначить первый класс
						case '4i0':
						case '4ii':
						case '4ss':
						case '4s0':
							tmplBlock+='column4';
							break;
						case '4ss':
							tmplBlock+='column4last';
							break;
						case '40i':
							tmplBlock+='hf4Inside';
								break;
						case '40s':
							tmplBlock+='hf4Shared';
								break;
						case '3ss':
							tmplBlock+='hf3Shared';
								break;
					}
					switch(tmplSchema){ // добавить второй класс
						case '4i0':
						case '4s0': 
							tmplBlock+=' hColMiddleLong';
								break;
						case '4ii':
						case '4ss':
							tmplBlock+=' hColShort';
							break;
						case '3ss':
							tmplBlock+=' hf3Shared';
								break;
					}

					tmplBlock+='"'; // дописываем закрывающую кавычку классов
					switch(tmplSchema){ // добавить атрибут для CSS:
						case '3ss':
						case '40i':
						case '40s':
							tmplBlock+=' footer';
								break;
						case '4ss':
							tmplBlock+=' right';
								break;
					}
				
				break;
				
				case 5: // 6-й блок
				
					switch(tmplSchema){ // назначаем первый класс: 
						case '4ss':
							tmplBlock+='hf4Shared';
								break;
						case '4ii':
							tmplBlock+='hf4Inside';
								break;
					}

					tmplBlock+='"'; // дописываем закрывающую кавычку классов
					switch(tmplSchema){ // добавить атрибут для CSS:
						case '4ss':
						case '4ii':
							tmplBlock+=' footer';
								break;
					}
				
				break;
			}
		}
		tmplBlock+=">&nbsp;</div>";
	}
	tmplBlock+="</div>";
	if (goLoop)
		document.getElementById('tmplPlace').innerHTML+='<div>'+tmplSchema+'</div>'+tmplBlock;
	else
		document.getElementById('tmplPlace').innerHTML=tmplBlock;
  }catch(e){
	  alert(e.message);
  }
}
// загрузим макет по сформированному шаблону
function loadTemplate(btn){ 
  try{
	// display: block - область макета, кнопки, модули
	display(['tmplPlace','tmpl_commands','sel_modules']);
	var topPos=$('#txtActions').offset().top;
	$("html, body").animate(
		{scrollTop:topPos},
		500,
		function(){
			stateTemplateIsLoaded();
		}
	);
	createTemplate(tmplSchema);
	var headerBlock=$("div[header='']")[0];
	if (headerBlock){
		var pWidth=$(headerBlock).width()-10;
		//alert(pWidth);
		headerBlock.innerHTML='<div>Текст подзаголовка:</div><input type="text" style="width:'+pWidth+'px; padding:4px;">'
	}
  }catch(e){
	  alert(e.message);
  }
}
<?	
$myscript=ob_get_contents();
ob_get_clean();
echo $myscript;
if (isset($dwshow)){?></script><? }?>