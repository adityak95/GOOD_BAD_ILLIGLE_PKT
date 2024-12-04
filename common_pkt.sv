class common_pkt;

static typedef enum bit [1:0]{
	GOOD,
	BAD,
	ILL
}pkt_type_t;	

static mailbox gen2bfm=new();
static string testcase="n_no_of_good_pkts";
static int count=2;
endclass
