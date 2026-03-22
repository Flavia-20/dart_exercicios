
main() {
	
	const boloPrecos = {
	'ovos': 5.5,
	'chocolate': 7.5,
	'cenoura': 6.5,
	};

	const ordem =['ovos', 'chocolate', 'limao'];
	double total = 0;

	for (var item in ordem) {
		if (boloPrecos.containsKey(item)) {
			total += boloPrecos[item]!;
		} else {
			print('O item $item não está no cardápio.');
		}
	}

	print("Total: $total");

}