#  56. Delivery Document Types and Item Categories

Alright.

What is a delivery document type?

Just like the way we have a sales document type, say, or so on and so forth, then deliver this order.

If there are deliverable items, of course.

You create your order quotation zero 1 or 21 and you deliver the document in Vl 01N.

And this is a separate class of document.

It's not the same as a sales document.

Luckily, there are not so many delivery document types.

Remember there are many sales document types or quotation consignments.

Contracts.

ET cetera.

ET cetera.

But in delivery, there are just two important document types.

One is Elf, which is for outbound delivery and for returns.

We have LR.

This one is for inbound delivery.

You don't need to go beyond this.

Just remember these two delivery document types.

One is Lf and the other one is LR.

Irrespective of what your sales type is, the order scheduling agreement contracts.

You can still use Elf and LR.

These two document types can capture everything that you need in a delivery document type.

In an order.

The document type controls of the document behaves right and at the line item level there is item category.

Say ten or tap or taps.

These are sales item categories.

Similarly, there are item categories at the delivery level as well.

And luckily they also have the same names to tap tous.

ET cetera.

ET cetera.

Same names as the corresponding sales item categories.

These are sales item categories.

Whereas these are delivery item categories.

Sales item categories have a bunch of controls behind them, like we have seen in the previous chapters.

The delivery item category, on the other hand, is much simpler.

Utmost, 2 to 3 controls that are really important.

Let's quickly go in and see the controls behind the delivery item category.

Go to SPRO IMG for delivery related configuration.

Don't go to the sales and distribution section.

Instead, go to logistics execution.

This is where some of you could get confused.

You know, you could be looking all around in SPRO and you might not find this.

So make sure you go to logistics execution for all delivery related configuration.

Sticks, execution.

Shipping deliveries.

We have the delivery document type and delivery item categories here.

Let's go to define delivery types.

Remember we said the most important delivery document types are Lf and LR.

Go ahead, pick Lf and go inside.

What are the main controls here?

I will highlight all the important controls, but again, not all the controls are important at this

point, but these are eventually important.

The first one is category.

This is similar to the sales document category.

What role does it play?

It defines how the document behaves.

For example, in sales, a quotation behaves one way.

An order behaves in a different way.

Right.

Similarly, Standard outbound document has a document category of J.

And standard inbound returns will have a different document category.

Well, we don't care about the document category itself, but it plays a role.

So you might have a question here.

If we just use two of them, why does SAP provide so many here?

We have 92 of them.

The reason is deliveries are not just used for sales.

They could be used for other processes as well.

Like.

Think of inter-company stock transfer.

Well, it is related to sales, but it's really an inventory process.

Sales just happens to trigger it.

Anything where a recorded goods movement needs to happen.

You need a delivery for that.

We just happened to use a delivery document type for inbound and outbound orders.

Overall, though, we have very little use for the delivery document type compared to other logistics

operations.

I mean, yeah, we need to use it, but compared to other logistics operations, our use of delivery

type is limited.

That's why deliveries are part of logistics execution rather than sales.

Okay.

That was the document category.

The next item is number ranges.

This part is easy, right?

We have internal number ranges, external number ranges and item number increment.

We have already seen them in the sales document type configuration.

Right.

In sales there used to be a sub item increment here.

You don't see that here.

Why?

We talked about subitem increments in the context of bombs.

Bill of materials.

There's something you have to understand here.

A bomb only exists at the sales document level.

So when it comes to the delivery, what happens?

What happens to the bomb?

The bomb becomes flat.

It loses its hierarchy, the parent child relationship.

But look at the problem here.

If there is a PC, say, with three parts in it, CPU monitor, keyboard ten, 20, 30, 40, so on.

20, 30 and 40 being the components will be part of ten.

That's how we define a bomb, right?

And that's how it fits into a sales order header.

One line and then components.

They are all linked together.

Marker 19.

Now how do we see it?

In a delivery?

In a delivery, what happens is the bomb gets flattened.

Out.

Into what?

Into a delivery group.

And that's defined in the item category level.

If you remember the sales item category controls, there's a field called application scope and structure

scope.

And right next to it, there's a field called Delivery Group.

So all the components of the bomb get flattened out.

And how is the delivery group used?

It just groups the components of the bomb together.

Why?

So that the components of the PC like the monitor, keyboard, CPU all go together.

The delivery group is how the delivery document ensures that all the parts of the Bom go together.

That's why you don't have a subitem increment.

The third field is order required.

This is always set to X for inbound delivery or outbound delivery.

Why is it set to X?

These document types.

Lf l r are only created with reference to a sales document.

You can't create them alone like standalone.

For example, if you go to VL01N and try and create a delivery of type lf without an order reference.

It's not possible to see the difference with order reference without order reference.

For all sales deliveries, beat returns or outbound.

We always need a sales document reference, meaning they should always be a demand document, which

is a sales order or a return order that triggers delivery.

Logistics cannot act on its own.

That's the summary of it.

In sales.

It's a sales order in returns, it's a return order.

So always ensure that this flag is turned on for elephant LR.

This ensures that somebody in the warehouse will not be able to create a delivery or an outbound delivery,

or even a return without an actual demand document.

The sales order.

You can only create an outbound delivery with reference to a sales order.

Similarly, if we have a return document, meaning somebody authorized a return, then you can create

a return delivery.

These two documents should never be created without a reference sales document.

That's what this field stands for.

The rest of them are not very important.

Output.

Determination.

Procedure.

Text.

Determination.

Procedure.

Root Determination.

Partner determination.

These are important, but like I said, not at this point.

So overall in delivery document type, there are three important controls.

Document category number ranges and order required.

We will now move on to delivery item categories.

Where is delivery item?

Categories.

Right beneath the dock type.

Once again, SAP makes our life easy.

They have the same names as the sales item categories.

The controls are a little different.

So if you go inside, can you see it's not as big as a sales item category?

It's pretty small.

Once again, what are the important controls here?

Document category.

Then we have relevance for picking and storage location relation for related fields.

And then text determination procedure.

That's it.

Very simple.

Right?

You already know what the document category is, and it defines the way an item category behaves for

ten, j for ten N, it's something else.

We don't care.

Relevancy for picking what is this field?

Let me give you a simple scenario.

You'll understand this field very easily.

You'd be tempted to think that every delivery item should be relevant for picking.

Why would we even do a delivery without picking?

Right.

Why would you want that item to be there when you are delivering something?

You would naturally tend to think that all the items are physical deliverables and hence, of course

they would require some kind of picking.

It could be picking manually or it could be picking via transfer order in the warehouse.

So if you make an item not relevant for picking meaning, check this off.

What happens is when you have this order ten line item, M0 one, quantity one, and you're trying to

create a delivery here, this order comes through line item ten, M0 one and and in the delivery there

is a delivery quantity of one and picking quantity, it will either be grayed out in case the item is

relevant for warehouse management or it will be just blank.

Until you go pick a quantity of one manually, put it in or use a transfer order.

Now, if you set this item category to be not relevant for picking, this entire field will be grayed

out and you cannot pick a quantity either manually or via the transfer order.

Once again come back to the same question.

What is the point in having this in the delivery?

One of the prime use cases for this is a bomb.

Think of the bomb top level component.

Let me start over again.

We'll take just three lines.

Line item ten PC 101 20.

Monitor 30 is a keyboard.

Higher level item is ten and all the quantities are one each.

Now let's deliver this.

When you deliver this line item.

Should this line item also be delivered?

Remember, it's a dummy part.

A phantom part.

It's not relevant for picking.

There is no part called a PC 101.

It's the monitor keyboard and the components that make up for that imaginary PC.

But should it be part of the delivery?

That's the next question.

The answer is yes, it should.

Let me tell you why.

Say we take a case where this does not come into the delivery.

This line item, the second and the third line items, the monitor keyboard and any of the components

come in.

So you've got a monitor, you got a keyboard.

And this line PC does not come in.

So you pick this, you pick this and you do the billing.

What do you have in the bill?

Monitor and a keyboard.

This is a delivery relevant billing meaning invoice is created with reference to the delivery and delivery

is created with reference to the order.

When you create the billing with reference to the delivery, only the monitor and the keyboard comes

through.

Now the customer will be confused.

He doesn't understand that this is part of a PC.

You see, he has ordered for a PC and he got the components monitor keyboard.

Where's the PC?

Well, he's under the PC, right?

That doesn't sound logical to the customer.

Right.

If you go order something from Dell and, you know, he sends an invoice saying, Hey, we got a keyboard,

you got a monitor.

Well, there should be something that binds all these things together.

That's exactly the problem that we're trying to solve here by making the top level part also flow into

the delivery.

But it's a phantom part.

But since it's a phantom part, we make it not relevant for picking.

That way the top level part PC.

Would just act as a placeholder just to hold the components, monitor and keyboard.

And finally, when you create the bill, it would make sense to the customer.

Oh, okay.

The monitor and the keyboard are part of the PC.

Great.

So that field relevant for delivery will be turned off.

When picking does not need to happen, but the item is relevant for delivery to make logical sense in

the final invoice.

Storage location is not required at this point.

Storage location is not required at this point.

There is a concept called storage location determination.

Some items are not relevant for storage location.

If you take the same example, the PC top level part is not relevant for storage location.

Right?

Why?

Because it's not stored in the first place.

It's a phantom part.

It's a dummy part.

It's a placeholder.

Or you can think of other examples like service parts.

Take warranty.

Three year additional service.

None of these types of materials require a storage location.

Why?

They're not stored, really?

It's not relevant for storage.

They don't need storage in cases like this.

You can just turn them off.

How about item categories like Tad or tasks?

Tad is one is a third party and another is service.

Can you see them here?

No.

Why that theory is service to us is third party.

Both of these items are not relevant for delivery.

You can't deliver service.

You your company cannot deliver a third party service.

Third party.

An order is delivered by the vendor.

So either way, there is no delivery.

That's why you don't see them as delivery item categories in this list.

They're all billed as order relevant items.

That's what you need to know about delivery document types and delivery item categories.

There is also a delivery item category determination.

It's exactly the same as a sales item category determination.

No difference whatsoever.

If you go to the configuration, you can see the four parameters.

Delivery document type item category group usage and higher level item category.

So that.

# 