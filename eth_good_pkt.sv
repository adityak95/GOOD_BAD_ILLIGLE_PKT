class eth_good_pkt extends eth_pkt;
static int count_good;

function  new();
	super.new();//calling base class new method
	count_good++;
endfunction
function void print(string str="eth_good_pkt");
		super.print(str);
		$display("\t count_good=%0d",count_good);
endfunction
constraint pkt_type_c{
		pkt_type==common_pkt::GOOD;
}
endclass
