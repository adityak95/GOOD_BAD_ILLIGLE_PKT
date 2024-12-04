class eth_ill_pkt extends eth_pkt;
static int count_ill;

function new();
	super.new();//calling base class new method
	count_ill++;
endfunction
function void print(string str="eth_ill_pkt");
		super.print(str);
		$display("\t count_ill=%0d",count_ill);
endfunction

constraint pkt_type_c{
		pkt_type==common_pkt::ILL;
}
endclass
