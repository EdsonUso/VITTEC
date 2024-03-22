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
    }D
}

function betterCalc(num,string){
    let qtdHectare = Number(input_hectare.value);
    let precoUva = Number(input_precoUva.value);
    let tonSafra = Number(input_safra.value);
    let maximo = Number(input_max.value);

    let trueTon = maximo;

    let trueLucro = (maximo * 1000) * precoUva;
    let afectTon = maximo - (maximo * num);
    let afectLucro = (1000 * afectTon) * precoUva;

    let lucro = (tonSafra * 1000) * precoUva






    let mediaTon = qtdHectare * 60;
    let mediaLucro = (precoUva * (mediaTon * 1000));

    if (tonSafra < mediaTon) {
        alert (`Segundo nossos calculos, você está tendo um prejuizo de ${trueLucro - lucro}. Indentificamos que a doença é a ${string}, com nosso projeto você vai conseguir reduzir isso em ${trueLucro - afectLucro}`)

    }

    alert(`o erro está no if`)

    console.log(mediaTon)
    console.log(tonSafra)
}


// Definindo o enum para representar as possíveis doenças

// Função para verificar a doença com base na descrição fornecida


function calc() {
    let qtdHectare = Number(input_hectare.value);
    let precoUva = Number(input_precoUva.value);
    let tonSafra = Number(input_safra.value);
    let lucro = ((1000 * tonSafra) * precoUva);


    let mediaTon = qtdHectare * 60;
    let mediaLucro = (precoUva * (mediaTon * 1000));

    if (tonSafra < mediaTon) {

        
        alert(`Segundo nossos calculos, você está tendo um prejuizo de ${mediaLucro - lucro}!`)

    }

    console.log(mediaTon)
    console.log(tonSafra)
}



