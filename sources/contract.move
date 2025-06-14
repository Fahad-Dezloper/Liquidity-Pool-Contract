// liquity pool
// coin 1 = 3200 USDT
// coint 2 = 312 Fab

// how 50 USDT in Fab
// formula with 5% fees

module liquidity_addr::Contract {
    use std::debug::print;

    const E_NOTENOUGH: u64 = 0;
    const Pooll_fab: u64 = 312;
    const Pooll_usdc: u64 = 3201;

    fun calculate_swap(coin1: u64, coin2: u64, coin1_amt: u64): u64{
        assert!(coin1_amt > 0 && coin1 > 0 && coin2 > 0, E_NOTENOUGH);

        let fee = coin1_amt * 5 / 1000;

        let mix_supply: u64 = coin1 + coin2;

        let new_usdt = coin1 + coin1_amt;

        let new_fab = mix_supply / (new_usdt - fee);

        let receive = coin2 - new_fab;

        return receive
    }

    #[test_only]
    fun test_function() {
        let swap_amount = 495;
        let result = calculate_swap(Pooll_usdc, Pooll_fab, swap_amount);
        print(&result);
    }
}
