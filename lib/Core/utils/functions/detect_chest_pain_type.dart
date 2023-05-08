String detectChestPainType(String chestPain){
  if(chestPain=='Typical Angina'){
    return '1';
  }else if(chestPain=='Atypical Angina'){
    return '2';
  }else if(chestPain=='Non-Angina Pain'){
    return '3';
  }else {
    return '4';
  }
}