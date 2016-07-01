#!/usr/bin/perl -w

# usage:
# ./shares.pl -t50 -p800 -s900 -q100

use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

my %opts;
getopts('q:p:a:s:t:', \%opts);


# input Perameters
my $profit = $opts{t}||50;
my $sharePurchasePrice = $opts{p}||0;
my $shareSalePrice = $opts{s}||0;
my $quantity = $opts{q}||0;
my $purchaseStampTax = '0.5';
my $transactionTax = '0.5';
my $transactionFee = '12.5';

my $totalPurchaseCost;
my $totalSaleReturn;
my $totalProfit;


print "Stocks\n\n";
print "Perameters: \n";
print "Minimum Profit Target(p): $profit\n";
print "Share purchase price(a): $sharePurchasePrice\n";
print "Share Sale Price(s): $shareSalePrice\n";
print "Share Quantity(q): $quantity\n\n";

&calculatePurchaseCost();
&calculateSaleCost();
&calsulateProfit();

sub calculatePurchaseCost {
	print "Purchase Cost\n";

	my $shareCost = $quantity * $sharePurchasePrice / 100;
	print "Share Cost: £$shareCost\n";
	# add commission and stamp duty 1%
	$shareCost += $shareCost / 100;
	print "with commission & stamp duty (1%): £$shareCost\n";
	# add transaction fee
	$shareCost += 12.50;
	print "with transaction fee: £$shareCost\n\n";
	
	$totalPurchaseCost = $shareCost;
}

sub calculateSaleCost {
	print "Sale Cost\n";
	my $shareValue = $quantity * $shareSalePrice / 100;
	print "Share Sale Value: £$shareValue\n";
	$shareValue -= 12.50;
	print "less transaction fee: £$shareValue\n";
	$shareValue -= $shareValue / 100 / 2;
	print "less commssion fee: £$shareValue\n\n";

	$totalSaleReturn = $shareValue;
}

sub calsulateProfit {

	$totalProfit = $totalSaleReturn - $totalPurchaseCost;
	print "Total Profit: $totalProfit\n\n";
}






# if($ARGV[0]){
#     $input = $ARGV[0];
#     print "got input: $input\n";
# }












print "\n";


__END__


profit minimum £50 (5000)

cost per buy/sell transaction
£25
0.5% Or £1 on each transaction which ever is greater

0.5% stamp duty on purchases only


what is the relationship between value of shares and share increase to make a sale profit of £50?

buy
sky 850p

200 x 850 = 170,000 (1700)
or
170,000 / 850 = 200
investment / share price = number of shares
+ 0.5% stamp = 8.5
+ 0.5% transaction fee = 8.5
+ 12.5 broker fee
cost == 1729.50

sell @ 900
200 x 900 = 180,000 (1800)
- 0.5% £9
- 12.5 broker fee
return == 1778.5

ROI
1778.5
- 1729.50
== £49




