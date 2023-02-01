// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // 0.8.7 ve sonraki sürümlerde gecerli

contract demo{
    int public sayi0=-12; // negatif deger alan integer 2^256
    uint public sayi1=7; // isaretsiz integer ( pozitif ) 2^256
    uint public sayi2=11;                                                // global degerler 
    uint8 public sayi3=255; // sınırlarız 2^8 (256)
    bool public durum=false; // false, true durumların kontrolu
    address public adresim= 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes1 public byte_deger = 0x65; // byte32
    uint public toplam = sayi1+sayi2;

function global_topla_function() public view returns(uint){ // dısardan deger alan function

    uint a=3;
    uint b=33;
    uint result = a + b + sayi2; // sayi1 global degisken
    return result;
}

function topla_function(uint c ) public pure returns(uint){// dısardan deger almadıgı icin pure, eger alırsa view

    uint a = 13;   // local degerler 
    uint b= 24;
    uint result = a + b + c ; 
    return result;
}

function carp_function() public pure returns(uint){

    uint c = 7;
    uint d = topla_function(c)*c;

    return d;

}

function dongu() public pure returns(uint){

    uint i;
    uint topla;
    for(i=0;i<11;i++){
    topla += i;
    }
    return topla;
}

    uint global_toplam;

function dongu2()public returns(uint){ //global degiskenli dongu

    uint i;
    for(i=0;i<11;i++){
        global_toplam += i;
    }
    return global_toplam;
}

    uint j=0;
    uint[] data;

function dizi_while()public returns(uint [] memory){ // dizinin içerisine sayı pushluyor & while döngüsü

    while(j<6){
        j++;
        data.push(j);
    }
    return data;
}

function if_else_fast(uint x) public pure returns(uint){ //if-else hızlı ve kısa 

    return x < 10 ? 1 : 2; // x, 10'dan kucukse 1 döndür, değilse 2 döndür

}

function if_else(uint y) public pure returns(uint){ //if-else normal 

    if(y<10){
    return 1;
    }
    else {
    return 2;
    }
}
uint dizi_uzunlugu=7;
uint[] dizi = new uint[](dizi_uzunlugu);

function dizi_orn()public returns(uint[] memory){

    uint i;
    for(i=0;i<5;i++){
        dizi[i]=i;        // dizinin i'ninci indisine i'yi ekliyor. ( "uint256[]: 0,1,2,3,4,0,0" ) dizinin boş yerlerine 0 atıyor null değil.
    }
    dizi.push(10);        //  ("uint256[]: 0,1,2,3,4,0,0,10") yani dizide yeni eleman oluşturuyor.

    return (dizi);
}

struct kitap{ // Veri yapısı 

    string ad;
    string yazar;
    uint id;
    bool stok_durumu;
}

    kitap kitap1; // nesne üretiliyor kitap1 diye. Bilgi girilmedi
    kitap kitap2 = // nesne üretildi bilgi girildi.
    kitap("Sefiller",
    "Victor Hugo",
    1,
    true);

    function set_kitap_detay() public {  // fonksiyon olarak ekleme yapildi.
        kitap1 = kitap("Suc ve Ceza",
        " Fyodor Dostoyev",
        2,false
        );
    }

    function get_kitap_detay() public view returns(string memory, string memory, uint ,bool){ // veri yapısının getirilmesi

    return (kitap2.ad, kitap2.yazar, kitap2.id, kitap2.stok_durumu);
    }

    enum hafta_gunleri{ //sabit değer almasını istediğimiz zaman enum kullanırız. Değişmez( default value). Struct yapısına benzer bir yapıya sahiptir.

        pazartesi,
        sali,
        carsamba,
        persembe,
        cuma,
        cumartesi,
        pazar
    }

    hafta_gunleri hafta;
    hafta_gunleri secim;

    hafta_gunleri constant varsayilan = hafta_gunleri.pazartesi;  // varsayilan degere pazartesiyi attik.

    function set_value() public{              // secim yapıyoruz.setliyoruz.
        secim = hafta_gunleri.cuma;
    }

    function get_secim() public view returns(hafta_gunleri){   //4 dondurur cumanin indisi
        return secim;
    }

    function get_varsayilan() public pure returns(hafta_gunleri){   // 0 dondurur pazartesinin indisi

        return varsayilan;        
    }

    address private owner;

    constructor() public {       //  güvenlik sikintisi bulunmaktadir. test olarak kullandığımız için deploy edebiliriz abstract yapısı ile oluşturarak güvenlik sorunu düzelir.
        owner=msg.sender;
    }

    function getOwner() public view returns(address){  // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 döner.
        return owner;
    }

    function getBalance() public view returns(uint256){  // bize bu kadar  99.999999999983274233 etherum tanımlamışlar ( her deploy ettiğimizde balance dusuyor gwey  gidiyor. !!)
        return  owner.balance;
    }

}