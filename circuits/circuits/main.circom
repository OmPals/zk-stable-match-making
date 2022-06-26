pragma circom 2.0.0;

template Smm(count) {
    //system of 5 artists and 5 collectors
    // private
    signal input man_pref[count+1][count+1];     //artist's preference list of each collector
    signal input woman_pref[count+1][count+1];   //collector's preference list of each artists

    
    signal output stablematch[count+1];    //the deal for the unique nft for each collector 
    
    var i;
    var j; 
    var current_woman;
    var current_man;

    var ranking[count+1][count+1];       //Ranking gives the ranking of each artist in the preference list of each collector
    var next[count+1];                 //which collector will be approached for each artist
    var matches[count+1];              //the current deal of each collector
    var freeMen[count+1];              //the count of free artists

    log(1);

    for(i=1; i<=count; i++) {
		for(j=1; j<=count; j++) {
			ranking[i][woman_pref[i][j]] = j; // initialize ranking
        }
    }

    for(i=1;i<=count;i++){
		freeMen[i] = i;
		next[i] = 1;
	}

    var front = 1;
    var rear = 1;
    var size = count;

    log(2);

    while(size > 0){
		current_man = freeMen[front];
		current_woman = man_pref[current_man][next[current_man]];

		if(matches[current_woman] == 0){
			matches[current_woman] = current_man;
            freeMen[front] = 0;
			front = 1 + (front%count);
            size = size-1;
		}
		else if(ranking[current_woman][current_man] < ranking[current_woman][matches[current_woman]]){
			var ex_man = matches[current_woman];
			
            freeMen[front] = 0;
            front = 1 + (front%count);

			matches[current_woman] = current_man;
			
            freeMen[rear] = ex_man;
            rear = 1 + (rear%count);
		}

		next[current_man] = next[current_man]+1;
	}

	for(i = 1; i <= count; i++){
		// log(matches[i]);      //artist
        // log(i);               //collector
        stablematch[i] <== matches[i];
	}

    log(3);
}

component main = Smm(5);
