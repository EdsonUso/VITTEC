function add() {
    div_add.innerHTML = `    <div class="area-complemento">
    <div class="box-question">
        <h2 class="titulo-radio">O quanto você é consciente sobre suas perdas na produção?</h2>
        <div class="radios">
            <input type="radio" name="nota_safra" id="radio_safra_nada" value="nada">
            <label for="radio_safra_nada">Nada</label>
            <input type="radio" name="nota_safra" id="radio_safra_pouco" value="pouco">
            <label for="radio_safra_pouco">Pouco</label>
            <input type="radio" name="nota_safra" id="radio_safra_razoavel" value="razoavel">
            <label for="radio_safra_razoavel">Razovalmente</label>
            <input type="radio" name="nota_safra" id="radio_safra_bastante" value="bastante">
            <label for="radio_safra_bastante">Bastante</label>
            <input type="radio" name="nota_safra" id="radio_safra_totalmente" value="totalmente">
            <label for="radio_safra_totalmente">Totalmente</label>
        </div>
        <h1 class="titulo-radio">Acha que suas uvas possam ter alguma doença patologica?</h1>
        <div class="radios">
            <input type="radio" name="possible_doenca" id="radio_sim" value="sim" onchange="checkPossible()">
            <label for="radio_sim"></label>
            <input type="radio" name="possible_doenca" id="radio_nao" value="nao" onchange="checkPossible()">
            <label for="radio_nao"></label>
            <input type="radio" name="possible_doenca" id="radio_naosei" value="naosei" onchange="checkPossible()">
            <label for="radio_naosei"></label>
        </div>
    </div>
</div>`

}

function checkPossible() {

    if (radio_sim.checked) {
        div_addNome.innerHTML = ` <div class="box-radios">
        <h2 class="titulo-radio">Sabe qual é a doença?</h2>
        <div class="radios">
            <input type="radio" name="OptionName" id="radio_seiName" value="sei" onchange = "nameDoenca()">
            <input type="radio" name="OptionName" id="radio_naoseiName" value="naosei" onchange = "nameDoenca()">
        </div>
    </div>`
    }
    if (radio_nao.checked) {
        alert('radio_nao')
    }
    if (radio_naosei.checked) {
        alert('radio_naosei')
    }

}

function nameDoenca() {
    if (radio_seiName.checked) {
        div_addDoenca.innerHTML = ` <div class="box-select">
        <h2 class="titulo-input">Por favor, nos diga o tipo de fungo:</h2>
        <select id="fungos" required>
            <option value="0" selected disabled></option>
            <option value="1">Antracnose</option>
            <option value="2">Míldio</option>
            <option value="3">Podridão amarga</option>
            <option value="4">Pé-preto</option>
        </select>
    </div>`
    }

    if (radio_naoseiName.checked) {
        div_addDoenca.innerHTML = ` Descreva abaixo as caracteristicas estranhas da sua plantação:
        <textarea id="input_desc" placeholder="descrição"></textarea>
        <div class="resultado" id="resultado"></div>
        <button onclick="check()">Analisar</button> `
    }
}

function betterCalc(num,string){
    var qtdHectare = Number(input_hectare.value);
    var precoUva = Number(input_precoUva.value);
    var tonSafra = Number(input_safra.value);
    var maximo = Number(input_max.value);

    var trueTon = maximo;

    var trueLucro = (maximo * 1000) * precoUva;
    var afectTon = maximo - (maximo * num);
    var afectLucro = (1000 * afectTon) * precoUva;

    var lucro = (tonSafra * 1000) * precoUva






    var mediaTon = qtdHectare * 60;
    var mediaLucro = (precoUva * (mediaTon * 1000));

    if (tonSafra < mediaTon) {
        alert (`Segundo nossos calculos, você está tendo um prejuizo de ${trueLucro - lucro}. Indentificamos que a doença é a ${string}, com nosso projeto você vai conseguir reduzir isso em ${trueLucro - afectLucro}`)

    }

    alert(`o erro está no if`)

    console.log(mediaTon)
    console.log(tonSafra)
}


// Definindo o enum para representar as possíveis doenças
const Disease = {
    ANTRACNOSE: {name: 'antracnose', value: 0.25},
    MILDIO: {name: 'mildio', value: 0.40},
    OIDIO: {name: 'oidio', value: 0.23}
};

const diseaseDescriptions = {
    [Disease.ANTRACNOSE]: `afeta principalmente as folhas, frutos e ramos das plantas. Ela causa manchas circulares ou em forma de anel, inicialmente de cor castanho que se tornam marrom escuro ou pretas. 
        Essas manchas podem se unir, formando lesões necróticas maiores. Em casos mais graves, as folhas podem cair, comprometendo a saúde da planta.`,
    [Disease.MILDIO]: `O míldio é uma doença fúngica que afeta várias plantas, incluindo videiras, batatas, tomateiros e roseiras. 
        Os sintomas incluem manchas oleosas ou pulverulentas nas folhas, caules e frutos, deformações e morte das plantas. 
        O controle do míldio geralmente envolve o uso de fungicidas e a eliminação de plantas infectadas.`,
    [Disease.OIDIO]: `O oídio é uma doença fúngica que afeta diversas plantas, como roseiras, videiras, árvores frutíferas, entre outras. 
        Os sintomas incluem manchas branco-acinzentadas nas folhas, frutificação branca e brilhante na face inferior da folha, manchas escuras irregulares nos ramos em desenvolvimento, entre outros. 
        O controle do oídio envolve o uso de fungicidas e a eliminação de plantas infectadas.`
};


// Mapeando as palavras-chave para cada doença
const keywords = {
    [Disease.ANTRACNOSE]: ['folhas', 'manchas', 'folha', 'circulares', 'circulo', 'frutos', 'ramo', 'fruta', 'castanho', 'marrom', 'castanho-escuro', 'necróticas', 'necroticas', 'necrotica', 'necrosada', 'preto', 'morta', 'pecíolo', 'pé', 'nervura', 'manchinhas', 'machas', 'cancro', 'tumor', 'ramos', 'gavinha', 'inflorescencia', 'flores', 'plantas', 'gavinha'],
    [Disease.VIRUS]: ['cinza', 'vermelho', 'rasgado', 'planta', 'caule', 'miolo', 'fruta', 'preto'],
    [Disease.FUNGO]: ['negocio', 'coisa', 'azul', 'amarelo'],
    [Disease.MILDIO]: ['óleo', 'oleo', 'marrom', 'brotos', 'machucada', 'machucado', 'queimado', 'folha', 'folhas', 'verde', 'verde-claro', 'molhado', 'encharcado', 'necrosado', 'caem', 'cair', 'morrem', 'morta', 'cachos', 'sarmento', 'crescem', 'machas', 'machado', 'escura', 'inflorescencia', 'flores', 'planta', 'plantas', 'deformado', 'deformação', 'gancho', 'torto', 'torta', 'destruido', 'flor', 'morta', 'enrugadas', 'escuras', 'dura', 'uva', 'cacho', 'bagos', 'fruta', 'escuro', 'fruto', 'duro', 'morto', 'diferente'],
    [Disease.OIDIO]: ['verde', 'verdes', 'tenro', 'tenros', 'branco', 'manchas', 'brancos', 'mancha', 'acizentado', 'cinza', 'cinza-claro', 'branco-acizentado', 'amarelo', 'pó', 'poeira', 'folha', 'folhas', 'planta', 'plantas', 'colorido', 'manchado', 'machada', 'retorcida', 'encolhida', 'torta', 'embolada', 'estranha', 'óleo', 'liquido', 'café', 'cafe', 'irregular', 'cicatriz', 'cicatrizes', 'rachar', 'rachadura', 'varise', 'celulite', 'podre', 'semente', 'apodrece', 'podre', 'apodreceu']
};

// Função para verificar a doença com base na descrição fornecida
function check() {
    var desc = input_desc.value.toLowerCase();

    var diseaseCount = {};
    for (var disease in keywords) {
        diseaseCount[disease] = 0;
        keywords[disease].forEach(keyword => {
            if (desc.includes(keyword)) {
                diseaseCount[disease]++;
            }
        });
    }

    var maxCount = 0;
    var maxDisease = null;
    for (var disease in diseaseCount) {
        if (diseaseCount[disease] > maxCount) {
            maxCount = diseaseCount[disease];
            maxDisease = disease;
        }
    }

    var nameResult = maxDisease.name;
    var result = maxDisease.value;

    betterCalc(result,nameResult)
}

function calc() {
    var qtdHectare = Number(input_hectare.value);
    var precoUva = Number(input_precoUva.value);
    var tonSafra = Number(input_safra.value);
    var lucro = ((1000 * tonSafra) * precoUva);


    var mediaTon = qtdHectare * 60;
    var mediaLucro = (precoUva * (mediaTon * 1000));

    if (tonSafra < mediaTon) {
        alert(`Segundo nossos calculos, você está tendo um prejuizo de ${mediaLucro - lucro}!`)

    }

    console.log(mediaTon)
    console.log(tonSafra)
}



