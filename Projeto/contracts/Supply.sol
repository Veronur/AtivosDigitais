pragma solidity ^0.5.0;

contract Supply {
    struct Recebeu {
        uint id;
        string produto;
        int quantidade;
        string qualidade;
        uint lote;
        address owner;
    }

    struct Colhido {
        uint id;
        string produto;
        int quantidade;
        string qualidade;
        uint lote;
        address owner;
    }

    struct Transportou {
        uint id;
        string produto;
        int quantidade;
        string qualidade;
        uint lote;
        address owner;
    }

    mapping(uint => Recebeu) public Recebidos;
    mapping(uint => Colhido) public Colhidos;
    mapping(uint => Transportou) public Transportados;

    uint public PlantacaoCount;
    uint public ColheitaCount;
    uint public TransporteCount;

//ADDERS
    function addRecebimento(string memory _produto, int _quantidade,string memory _qualidade, uint lote) public {
        PlantacaoCount ++;
        Recebidos[PlantacaoCount-1] = Recebeu(PlantacaoCount, _produto, _quantidade,_qualidade,lote,msg.sender);
    }

    function addColheita(string memory _produto, int _quantidade, string  memory _qualidade, uint lote) public {
        ColheitaCount ++;
        Colhidos[ColheitaCount-1] = Colhido(ColheitaCount, _produto, _quantidade,_qualidade, lote,msg.sender);
    }

    function addTransporte(string memory _produto, int _quantidade, string  memory _qualidade,uint lote) public {
        TransporteCount ++;
        Transportados[TransporteCount-1] = Transportou(TransporteCount, _produto, _quantidade,_qualidade,lote,msg.sender);
    }

//Geters
   //Produto
    function getRecebimentoProduto(uint id) public view returns (string memory){
        return Recebidos[id-1].produto;
    }

    function getColheitaProduto(uint id) public view returns (string memory){
        return Colhidos[id-1].produto;
    }

    function getTransporteProduto(uint id) public view returns (string memory){
        return Transportados[id-1].produto;
    }

   //Quantidade
    function getRecebimentoQuantidade(uint id) public view returns (int){
        return Recebidos[id-1].quantidade;
    }

    function getColheitaQuantidade(uint id) public view returns (int){
        return Colhidos[id-1].quantidade;
    }

    function getTransporteQuantidade(uint id) public view returns (int){
        return Transportados[id-1].quantidade;
    }

   //Qualidade
    function getRecebimentoQualidade(uint id) public view returns (string memory){
        return Recebidos[id-1].qualidade;
    }

    function getColheitaQualidade(uint id) public view returns (string memory){
        return Colhidos[id-1].qualidade;
    }

    function getTransporteQualidade(uint id) public view returns (string memory){
        return Transportados[id-1].qualidade;
    }

   //Lote
    function getRecebimentoLote(uint id) public view returns (uint){
        return Recebidos[id-1].lote;
    }

    function getColheitaLote(uint id) public view returns (uint){
        return Colhidos[id-1].lote;
    }

    function getTransporteLote(uint id) public view returns (uint){
        return Transportados[id-1].lote;
    }

   //Owner
    function getRecebimentoOwner(uint id) public view returns (address){
        return Recebidos[id-1].owner;
    }

    function getColheitaOwner(uint id) public view returns (address){
        return Colhidos[id-1].owner;
    }

    function getTransporteOwner(uint id) public view returns (address){
        return Transportados[id-1].owner;
    }

   //Ids por Lote
    function getRecebimentoIdPorLote(uint lote) public view returns (uint[] memory){

        uint[] memory array = new uint[](PlantacaoCount);
        uint j = 0;
        for(uint8 i = 0; i <= PlantacaoCount; i++){
            if (lote==Recebidos[i].lote){
                array[j] = (Recebidos[i].id);
                j++;
            }
        }
        return array;
    }

    function getColheitaIdPorLote(uint lote) public view returns (uint[] memory){

        uint[] memory array = new uint[](ColheitaCount);
        uint j = 0;
        for(uint8 i = 0; i <= ColheitaCount; i++){
            if (lote==Colhidos[i].lote){
                array[j] = (Colhidos[i].id);
                j++;
            }
        }
        return array;
    }

    function getTransporteIdPorLote(uint lote) public view returns (uint[] memory){

        uint[] memory array = new uint[](TransporteCount);
        uint j = 0;
        for(uint8 i = 0; i <= TransporteCount; i++){
            if (lote==Transportados[i].lote){
                array[j] = (Transportados[i].id);
                j++;
            }
        }
        return array;
    }

}


