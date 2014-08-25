#!/usr/bin/perl
use v5.10;
use Data::Dumper;

my $calculator = do{
    use Regexp::Grammars;
    qr{
        <grammar>

        <objrule: grammar>
          <MATCH=SUM> | <MATCH=MIN> | <MATCH=MAX> | <MATCH=AVERAGE> | <error: Expected SUM, MIN, MAX or AVERAGE >

        <objrule: SUM>
            ^SUM:\s? ( <[Y=Literal]> , )* <X=Literal> $ 
        
        <objrule: MIN>
            ^MIN:\s? ( <[Y=Literal]> , )* <X=Literal> $
        
        <objrule: MAX>
            ^MAX:\s? ( <[Y=Literal]> , )* <X=Literal> $
        
        <objrule: AVERAGE>
            ^AVERAGE:\s? ( <[Y=Literal]> , )* <X=Literal> $
        
        <objtoken: Literal>
            <value=( \d+ )>
    }xms
};

$num_args = scalar @ARGV;

if($num_args != 1){
    print "Usage: calc.pl file_name\n";
    exit;
}

my $file_name = @ARGV[0];
open my $file, $file_name or die "Could not open $file: $!";

while (my $input = <$file>) {
    chomp($input);
    my $debug = $input =~ s{^show \s+}{}xms;

    if ($input =~ /$calculator/ ) {
        
            $val = $/{grammar}->eval();
            say $val;
        
    } else{
        say "Failure on '$input'; Invalid syntax or unknown command.";
    }
    close (ASM); 
}

sub SUM::eval{
    my ($self) = @_;
    my $x = $self->{X}->eval();
    my $y = $self->{Y};
    my $sum = 0;
    $sum+=$x;
    foreach my $a (@$y) {
        my $val = $a->eval();
        $sum += $val;
        
    }
    
    return "SUM $sum";
}

sub AVERAGE::eval{
    my ($self) = @_;
    my $x = $self->{X}->eval();
    my $y = $self->{Y};
    my $sum = 0;
    $sum+=$x;
    my $count =1;
    foreach my $a (@$y) {
        my $val = $a->eval();
        $sum += $val;
        $count++;
    }
    my $avg = $sum/$count;
    return "AVERAGE $avg";
}

sub MIN::eval{
    my ($self) = @_;
    my $x = $self->{X}->eval();
    my $y = $self->{Y};
    my $min = $x;
    foreach my $a (@$y) {
        my $val = $a->eval();
        if($val < $min){
            $min = $val;
        }
        
    }
    return "MIN $min";
}

sub MAX::eval{
    my ($self) = @_;
    my $x = $self->{X}->eval();
    my $y = $self->{Y};
    my $max = $x;
    foreach my $a (@$y) {
        my $val = $a->eval();
        if($val > $max){
            $max = $val;
        }
    }
    return "MAX $max";
}

sub Literal::eval {
    my ($self) = @_;
    my $val = $self->{value};
    return $val;
}