String detectChestPainType(String chestPain){
  if(chestPain=='Typical Angina'){
    return '1';
  }else if(chestPain=='Atypical Angina'){
    return '2';
  }else if(chestPain=='Non-Angina Pain'){
    return '3';
  }else if(chestPain=='Asymptomatic'){
    return '4';
  }if(chestPain=='1'){
    return 'Typical Angina';
  }else if(chestPain=='2'){
    return 'Atypical Angina';
  }else if(chestPain=='3'){
    return 'Non-Angina Pain';
  }else {
    return 'Asymptomatic';
  }
}