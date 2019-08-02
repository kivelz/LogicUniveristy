using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using storemanagement.Models;
using storemanagement.Models.DTO;

namespace storemanagement.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session["cart"] as List<Product> ?? new List<Product>();

            if (cart.Count == 0 || Session["cart"] == null)
            {
                ViewBag.Message = "Your cart is empty.";
                return View();
            }

            int qty = 0;

            foreach(var item in cart)
            {
                qty += 1;
            }
            ViewBag.TotalQty = qty;

            return View(cart);


        }

        public ActionResult CartPartial()
        {

            RequestItemDTO request = new RequestItemDTO();
            int qty = 0;
            
            if(Session["cart"] != null)
            {
                var list = (List<RequestItemDTO>)Session["cart"];


                foreach(var item in list)
                {
                    qty += item.Qty;
                }
                request.Qty = qty;

            }else
            {
                request.Qty = 0;
            }
            return PartialView(request);
        }
    }
}